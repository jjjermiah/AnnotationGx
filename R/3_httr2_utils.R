#' Builds a URL by concatenating the input arguments and encoding it.
#'
#' @param ... The components of the URL.
#' @return The encoded URL.
#' @noRd
.buildURL <- function(...) {
    paste0(stats::na.omit(unlist(list(...))), collapse='/') |> utils::URLencode()
}

#' Builds an HTTP request using the provided URL.
#'
#' @param url The URL for the request.
#' @return The built HTTP request.
#' @noRd
.build_request <- function(url){
    httr2::request(url) |>
        httr2::req_retry(max_tries = 3) |>
        httr2::req_error(is_error = \(resp) FALSE)
}

#' Performs an HTTP request.
#'
#' @param request The HTTP request to perform.
#' @return The response of the HTTP request.
.perform_request <- function(request){
    httr2::req_perform(request)
}


.perform_request_parallel <- function(reqs, on_error = "continue", progress = TRUE, ...){
    httr2::req_perform_parallel(reqs, on_error = on_error, progress = progress,...)
}


#' Parses the JSON response from an HTTP request.
#'
#' @param resp The response object from the HTTP request.
#' @return The parsed JSON response.
.parse_resp_json <- function(resp){
    httr2::resp_body_json(resp, simplifyVector = TRUE)
}


#' Parses the TSV response from an HTTP request.
#' @param resp The response object from the HTTP request.
#' @return The parsed TSV response.
#' @noRd
#' @export
#'
#'
.parse_resp_tsv <- function(resp, show_col_types = FALSE, skip = 0){
    readr::read_tsv(resp$body, skip = skip, show_col_types = show_col_types)
}

#' Builds a PubChem HTTP request using the provided URL.
#'
#' @param url The URL for the request.
#' @return The built PubChem HTTP request.
#' @noRd
.build_pubchem_request <- function(url){
    .build_request(url) |>
        httr2::req_throttle(rate = 1000/60)
}

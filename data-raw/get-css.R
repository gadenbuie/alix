if (fs::dir_exists("inst/css")) fs::dir_delete("inst/css")
fs::dir_create("inst/css", recurse = TRUE)

tmpdir <- fs::file_temp("a11ycss")
r <- git2r::clone("https://github.com/ffoodd/a11y.css.git", tmpdir)

version <- jsonlite:::read_json(fs::path(tmpdir, "package.json"))$version

css_files <- fs::dir_ls(fs::path(tmpdir, "css"))

fs::file_copy(css_files, "inst/css", overwrite = )
writeLines(version, "inst/css/.version")

fs::dir_delete(tmpdir)

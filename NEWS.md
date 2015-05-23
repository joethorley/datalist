# NEWS

# datalist 0.5.0

- added function `conversion_terms` to get mean and sd of converted variables

# datalist 0.4.1

- `new_data` now runs on objects of class `tbl_df`

# datalist 0.4

* added function `is_converted_data` to test if data has already been converted.

* simpler messages when input argument conditions not meet

# datalist 0.3

* deprecated `generate_data` function for `new_data` which renames `range` argument
as `sequence` and also has `observed` function to only select observed values

# datalist 0.2

* Released on CRAN

# Bug Reports 

For more fine-grained list of changes or to report a bug, consult 

* [The commit log](https://github.com/joethorley/datalist/commits/master)
* [The issues log](https://github.com/joethorley/datalist/issues)

# Versioning

Releases are numbered with the following semantic versioning format:

\<major\>.\<minor\>.\<patch\>

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch

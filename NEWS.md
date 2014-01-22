# NEWS

# datalist 0.3

* Added `generate_data` function now has a `obs_by` argument that can be used
to specify variables for which the returned values should only include values
observed in the original dataset.

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

# functions.mk

This file provides utility functions that can be used by other makefiles (using [`$(call)`](https://www.gnu.org/software/make/manual/html_node/Call-Function.html)).

## Exposed functions

| Function                                     | Details                                                                                                   |
|----------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| `$(call fn_version_valid, version)`          | Returns `1` if `version` is a valid semantic version. Otherwise, returns `0`                              |
| `$(call fn_version_major, version)`          | Returns the major component for given `version`                                                           |
| `$(call fn_version_minor, version)`          | Returns the minor component for given `version`                                                           |
| `$(call fn_version_patch, version)`          | Returns the patch component for given `version`                                                           |
| `$(call fn_host_valid, host)`                | Returns `1` if `host` is a valid host string                                                              |
| `$(call fn_host_os, host)`                   | Returns the OS component for given `host`                                                                 |
| `$(call fn_host_arch, host)`                 | Returns the ARCH component for given `host`                                                               |
| `$(call fn_subdir, childDir, parentDir)`     | If `childDir` is a subdirectory inside `parentDir`, returns `childDir`. Otherwise, returns an empty value |
| `$(call fn_eq, srt1, str2)`                  | If `str1` equals `str2`, returns `str1`. Otherwise, returns an empty value                                |
| `$(call fn_cut,base_string,delimiter,index)` | Cuts a string based on given delimiter                                                                    |
| `$(call fn_word,base_string,index)`          | Returns the n-th word in a string                                                                         |
| `$(call fn_unique,list_of_words)`            | Removes duplicate words without sorting                                                                   |


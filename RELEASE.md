# Releasing a new version of checkr-official

## Release process

1. Create a list of all the changes since the prior release
    1. Compare the latest release to master using
       https://github.com/checkr/checkr-ruby/compare/`${latest}`...master
    1. Open the linked pull requests from all the `Merge pull request #...` commits
    1. For all non-documentation PRs, copy title (including pull request number)
       into markdown list items
    1. Sort into logical buckets, like "New", "Improvement", "Fix"
    1. Reorganize to put the pull request number at the end of the line with author in parenthesis
1. Ensure there are no breaking changes, or if there are breaking changes you'll need to bump
   the major version, following [SemVer](https://semver.org/)
1. Update the version
    1. Update the constant in `lib/checkr/version.rb`
    1. Commit and push to your branch
    1. Get it reviewed and merge to master
1. Move to master branch and pull last version
1. Run the `bin/release` script to cut a release

# CITEKit packages and builds #

Zipped packages with md5 and sha1 checksums can be manually downloaded [here][1];  to include a maven artifact in an automated build, use group `org.homermultitext` and package `citekit`.

[1]: http://beta.hpcc.uh.edu/nexus/content/repositories/releases/org/homermultitext/citekit/


## gradle build system ##

This repository includes a gradle build file you can use to package maven artifacts.

The standard gradle `buildArchives` task makes a zip file with the citekit package ready for inclusion in a web site.  To publish the artifact to a nexus repository, make a copy of the file `localpub.gradle`, set appropriate values for the variables defined there, and pass the name of the file as the `pub` property when invoking the standard gradle `uploadArchives` tasks.  E.g.,

    gradle -Ppub=localsettings.gradle uploadArchives

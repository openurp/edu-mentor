import org.openurp.parent.Dependencies._
import org.openurp.parent.Settings._


ThisBuild / organization := "org.openurp.edu.mentor"
ThisBuild / version := "0.0.2"

ThisBuild / scmInfo := Some(
  ScmInfo(
    url("https://github.com/openurp/edu-mentor"),
    "scm:git@github.com:openurp/edu-mentor.git"
  )
)

ThisBuild / developers := List(
  Developer(
    id = "chaostone",
    name = "Tihua Duan",
    email = "duantihua@gmail.com",
    url = url("http://github.com/duantihua")
  )
)

ThisBuild / description := "OpenURP Edu Mentor"
ThisBuild / homepage := Some(url("http://openurp.github.io/edu-mentor/index.html"))

val apiVer = "0.38.2"
val starterVer = "0.3.31"
val baseVer = "0.4.23"
val eduCoreVer = "0.2.3"
val openurp_edu_api = "org.openurp.edu" % "openurp-edu-api" % apiVer
val openurp_stater_web = "org.openurp.starter" % "openurp-starter-web" % starterVer
val openurp_base_tag = "org.openurp.base" % "openurp-base-tag" % baseVer
val openurp_edu_core = "org.openurp.edu" % "openurp-edu-core" % eduCoreVer
val openurp_std_core = "org.openurp.std" % "openurp-std-core" % "0.0.1"

lazy val root = (project in file("."))
  .enablePlugins(WarPlugin, TomcatPlugin)
  .settings(
    name := "openurp-edu-mentor-webapp",
    common,
    libraryDependencies ++= Seq(openurp_stater_web, openurp_edu_core, openurp_std_core),
    libraryDependencies ++= Seq(openurp_edu_api, beangle_ems_app, openurp_base_tag)
  )


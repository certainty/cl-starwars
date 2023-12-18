(in-package :asdf-user)

(defsystem  "cl-starwars"
  :description "Let's build and API, shall we"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :maintainer "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/cl-starwars.git")
  :license "BSD"
  :version "1.0"
  :depends-on
  (:alexandria
   :serapeum
   :frugal-uuid
   :clack
   :woo
   :ningle
   :cl-json
   :local-time)
  :serial t
  :pathname "src"
  :components
  ((:file "packages")
   (:file "routes")))

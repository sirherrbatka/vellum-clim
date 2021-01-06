(cl:in-package #:cl-user)


(asdf:defsystem vellum-clim
  :name "vellum-clim"
  :version "0.0.0"
  :license "BSD simplified"
  :author "Marek Kochanowicz"
  :depends-on ( :iterate
                :vellum
                :mcclim
                :documentation-utils-extensions)
  :serial T
  :pathname "src"
  :components ((:file "package")
               (:file "code")))

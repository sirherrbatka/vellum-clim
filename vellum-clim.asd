(cl:in-package #:cl-user)


(asdf:defsystem vellum-clim
  :name "vellum-clim"
  :version "0.0.0"
  :description "Simplistic vellum data frames viewer made with mcclim."
  :license "BSD simplified"
  :author "Marek Kochanowicz"
  :depends-on ( :iterate
                :vellum
                :mcclim)
  :serial T
  :pathname "src"
  :components ((:file "package")
               (:file "code")))

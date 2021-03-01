(use-modules (guix)
	     (guix build-system gnu)
	     (guix licenses))
(package
 (name "chello")
 (version "1.0")
 (source (origin
	  (method url-fetch)
	  (uri (string-append "https://github.com/SCP-EEE/chello/archive/v" version ".tar.gz"))
	  (sha256
	   (base32 "1r2a8swbwv5ymwhqs31gs7l5mnqdixfq2615kvrsm3594r0sfj7b"))))
 (build-system gnu-build-system)
 (synopsis "chello package")
 (description "hello print")
 (home-page "https://github.com/SCP-EEE")
 (license gpl3+))

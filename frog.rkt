#lang frog/config

;; Called early when Frog launches. Use this to set parameters defined
;; in frog/params.
(define/contract (init)
  (-> any)
  (current-scheme/host "http://blog.khinsen.net")
  (current-uri-prefix "/")
  (current-title "Konrad Hinsen's Blog")
  (current-author "Konrad Hinsen")
  (current-editor "$EDITOR")
  (current-editor-command "{editor} {filename}")
  (current-show-tag-counts? #t)
  (current-permalink "/posts/{year}/{month}/{day}/{title}/index.html")
  (current-index-full? #f)
  (current-feed-full? #t)
  (current-max-feed-items 20)
  (current-decorate-feed-uris? #t)
  (current-feed-image-bugs? #t)
  (current-posts-per-page 10)
  (current-index-newest-first? #t)
  (current-posts-index-uri "/index.html")
  (current-source-dir "_src")
  (current-output-dir "site"))

;; Called once per post and non-post page, on the contents.
(define/contract (enhance-body xs)
  (-> (listof xexpr/c) (listof xexpr/c))
  ;; Here we pass the xexprs through a series of functions.
  (~> xs
      (syntax-highlight #:python-executable "python"
                        #:line-numbers? #t
                        #:css-class "source")
      (auto-embed-tweets #:parents? #t)
      (add-racket-doc-links #:code? #t #:prose? #t)))

;; Called from `raco frog --clean`.
(define/contract (clean)
  (-> any)
  (void))

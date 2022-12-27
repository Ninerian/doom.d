;;; +ivy.el -*- lexical-binding: t; -*-

;; While in an ivy mini-buffer =C-o= shows a list of all possible actions one may take.
;; By default this is ~#'ivy-read-action-by-key~ however a better interface to this
;; is using Hydra.
(setq ivy-read-action-function #'ivy-hydra-read-action)

;; I currently have ~40k functions. This seems like sufficient motivation to
;; increase the maximum number of items ivy will sort to 40k + a bit, this way
;; =SPC h f= et al. will continue to function as expected.
(setq ivy-sort-max-size 50000)

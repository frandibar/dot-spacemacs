;; TODO
;; The following two functions should be replaced by a smarter one that knows if word at point is an address or trx.

(defun frandibar-blockchain-address ()
  "Open blockchain address info in browser for address at point."
  (interactive)
  (browse-url (concat "https://blockchain.info/address/" (word-at-point))))

(defun frandibar-blockchain-transaction ()
  "Open blockchain transaction info in browser for trx at point."
  (interactive)
  (browse-url (concat "https://blockchain.info/tx/" (word-at-point))))

(defun frandibar-blockchain-utxo ()
  "Fetch blockchain unspent outputs info into restclient buffer for address at point."
 (interactive)
 (restclient-http-do "GET" (concat "https://blockchain.info/unspent?active=" (word-at-point)) nil nil nil nil))

(defun frandibar-insight-dev-utxo ()
  "Fetch insight devel unspent outputs info into restclient buffer for address at point."
  (interactive)
  (restclient-http-do "GET" (concat "http://100.0.0.194:3000/api/addr/" (word-at-point) "/utxo") nil nil nil nil))

(defun frandibar-insight-utxo ()
  "Fetch insight devel unspent outputs info into restclient buffer for address at point."
  (interactive)
  (restclient-http-do "GET" (concat "http://live.insight.is/api/addr/" (word-at-point) "/utxo") nil nil nil nil))

(defun frandibar-py-goto-class ()
  "Find definition of class under cursor."
  (interactive)
  (projectile-ag (concat "class " (word-at-point) "(")))

(defun frandibar-py-goto-def ()
  "Find definition of definition under cursor."
  (interactive)
  (projectile-ag (concat "def " (word-at-point) "(")))

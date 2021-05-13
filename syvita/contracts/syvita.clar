;; Syvita DAO
;; Founded by @pxydn

;; error codes
(define-constant NOT_LATEST_VERSION u1)
(define-constant NOT_MEMBER u2)

;; other constants
(define-constant MAX_UPDATE_SIGNATURES u3)

;; syvita fungible token shows membership
(define-fungible-token syvita)

;; Update engine

(define-data-var isLatestVersion bool false)
(define-data-var latestVersion (optional principle) none)

(define-read-only is-latest-version
    (if isLatestVersion
        (ok true)
        (err NOT_LATEST_VERSION)
    )
)

(define-read-only get-latest-version
    (if isLatestVersion
        (err IS_LATEST_VERSION)
        (ok latestVersion)
    )
)

(define-private (pubkey-to-address (address principle)))

(define-public (create-update-proposal 
        (uniqueUpdateId (string-utf8 u32))
        (title (string-utf8 u32))
        (newContract principle)
        (update-uri (string-utf8 u64))
        (signatures (list MAX_UPDATE_SIGNATURES (signature ((buff 64) | (buff 65)))))
        )
    ) 
    (begin 
        (fold if ))
        ;; use fold to iterate through list, unwrap each signature, use secp256k1-recover? to get
        ;; pubkey from signature and principal-of? to convert said pubkeys to addresses. 
        ;; then verify that each address is a member of syvita by checking for ownership of syvita ft
        ;; and use secp256k1-verify to verify each signature of the uniqueUpdateId hash matches.
        
        ;; if all go ok, then it is added to be voted on. with a majority vote, the contract 
        ;; will test that essential functions work on the new contract and then update the toplevel
        ;; data-vars to show the new version of the DAO. 
    )

;; RBAC engine

(define-private is-syvirean (account principle)
    (if (> (ft-get-balance syvita account) u0)
        (ok true)
        (err NOT_MEMBER)
    )
)

;; Proposal engine

(define-map Proposals 
    {
        x: int 
    }
    {
        square: int
    }
)

(define-public (create-proposal (title (string-utf8 u32) ())) 
    (if (unwrap! (is-syvirean contract-caller))
        (begin
            
        )
        (err NOT_MEMBER)
    ) 
)
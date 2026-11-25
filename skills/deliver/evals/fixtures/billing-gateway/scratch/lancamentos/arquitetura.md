# Arquitetura: lançamentos de cobrança (aprovada pelo dono)

## Fluxo

Quem chama manda `POST /api/v1/integrations/{integration}/invoices` com `Idempotency-Key` e `actor`. O gateway reserva a chave em `billing_postings`, chama o driver do pacote `acme/billing` uma vez, guarda o resultado e responde. Um lançamento nunca é repetido sozinho.

## Tabela

`billing_postings`: `team_id`, `idempotency_key`, `request_hash`, `operation`, `state` (`pending`, `written`, `not_written`, `uncertain`), `response`. Índice único `(team_id, idempotency_key)`.

## Classes

`PostingOperation`, `BillingPoster`, `RunPosting`. O lançamento espelha a consulta.

## PRs

| # | Repositório | PR | Depende de |
|---|---|---|---|
| L1 | `acme/billing` | O driver passa a devolver a recusa "já lançado" com o protocolo existente. Sai como 2.3.1. | nada |
| C1 | este | `billing_postings` (migration), `RunPosting`, `BillingPoster`, `post_invoice`. | L1 publicada para ir a produção |
| C2 | este | `post_credit`. | C1 |

L1 e C1 podem começar em paralelo: a C1 roda com o pacote 2.3.0 e o cliente falso. O que espera a 2.3.1 é subir a restrição do Composer e o teste do "já lançado".

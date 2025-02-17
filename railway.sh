#!/bin/bash
# Configurações iniciais (executa o setup)
bundle exec rails ip_lookup:setup

# Inicia o worker (Sidekiq) em segundo plano
bundle exec sidekiq -C config/sidekiq.yml &

# Inicia o servidor web em primeiro plano, para manter o container ativo
bin/rails server -p $PORT -e $RAILS_ENV

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'rails-ujs', to: 'https://cdnjs.cloudflare.com/ajax/libs/rails-ujs/7.0.2/rails-ujs.min.js'

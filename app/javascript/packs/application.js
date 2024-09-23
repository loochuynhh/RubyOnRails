import $ from 'jquery'; 
import { Turbo } from "@hotwired/turbo-rails";
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import "bootstrap"; 
import "bootstrap/dist/css/bootstrap.min.css"; 

window.$ = $;
window.jQuery = $;

Rails.start();
ActiveStorage.start();
Turbo.start();

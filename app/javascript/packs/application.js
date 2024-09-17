import { Turbo } from "@hotwired/turbo-rails";
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";

Rails.start();

ActiveStorage.start();

Turbo.start();


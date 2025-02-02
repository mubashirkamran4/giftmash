import { Application } from "@hotwired/stimulus"
import GiftmashController from "./giftmash_controller";

const application = Application.start();

application.register("giftmash", GiftmashController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application };

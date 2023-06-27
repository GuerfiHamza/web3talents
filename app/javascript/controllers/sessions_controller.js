// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "inputEthMessage", "inputEthAddress", "inputEthSignature", "formNewSession", "formNewUser", "buttonEthConnect", "inputEthModal" ]

  connect() {
    if (this.hasFormNewSessionTarget) {
      this.inputEthMessageTarget.hidden = true;
      this.inputEthAddressTarget.hidden = true;
      this.inputEthSignatureTarget.hidden = true;
    }
    if (this.hasFormNewUserTarget) {
      this.inputEthAddressTarget.hidden = true;
    }
    if (typeof window.ethereum !== 'undefined') {
    } else {
      this.buttonEthConnectTarget.innerHTML = "No Ethereum Context Available";
      this.buttonEthConnectTarget.disabled = true;
    }
  }

  async signUpWithEth() {
    this.buttonEthConnectTarget.disabled = true;
    const accounts = await this.requestAccounts();
    const etherbase = accounts[0];
    this.inputEthAddressTarget.value = etherbase;
    this.formNewUserTarget.submit();
  }

  async signInWithEth() {
    this.buttonEthConnectTarget.disabled = true;
    const accounts = await this.requestAccounts();
    const etherbase = accounts[0];
    const nonce = await this.getUuidByAccount(etherbase);
    if (nonce) {
      const customTitle = "Webconnect - Sign in :";
      const requestTime = new Date().getTime();
      const message = customTitle + "," + requestTime + "," + nonce;
      const signature = await this.personalSign(etherbase, message);
      this.inputEthMessageTarget.value = message;
      this.inputEthAddressTarget.value = etherbase;
      this.inputEthSignatureTarget.value = signature;
      this.formNewSessionTarget.submit();
    } else {
      this.inputEthModalTarget.classList.remove("hidden");
      this.inputEthModalTarget.classList.add("flex");
      this.inputEthModalTarget.value = "Please sign up first!";
    }
  }

  async requestAccounts() {
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
    return accounts;
  }

  async personalSign(account, message) {
    const signature = await ethereum.request({ method: 'personal_sign', params: [ message, account ] });
    return signature;
  }

  async getUuidByAccount(account) {
    const response = await fetch("/api/v1/users/" + account);
    const nonceJson = await response.json();
    if (!nonceJson) return null;
    const uuid = nonceJson[0].eth_nonce;
    return uuid;
  }
}

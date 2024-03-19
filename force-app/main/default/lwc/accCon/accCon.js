import { LightningElement, wire, track } from "lwc";
import getAccounts from "@salesforce/apex/AccountController.getAccounts";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
//import changeName from "@salesforce/apex/AccountController.changeName";
//import { refreshApex } from "@salesforce/apex";

export default class AccCon extends LightningElement {
  showchild = false;
  @track data = [];
  @track id;
  createNew = false;

  @track columns = [
    { label: "ID", fieldName: "Id" },
    { label: "Name", fieldName: "Name" },
    {
      label: "Action",
      type: "button",
      initialWidth: 135,
      typeAttributes: {
        label: "Update Name",
        name: "clicked",
        title: "Click to View Details"
      }
    }
  ];
  handleRowAction(event) {
    const row = event.detail.row;
    this.id = row.Id;
    this.showchild = true;
  }
  hidechild() {
    this.showchild = false;
    this.createNew = false;
  }
  handleClick() {
    this.createNew = true;
  }
  // showtoast() {
  //   const cc = new ShowToastEvent({
  //     title: "Success",
  //     message: "Toast message displayed " + this.id,
  //     variant: "success"
  //   });
  //   this.dispatchEvent(cc);
  // }

  connectedCallback() {
    getAccounts()
      .then((result) => {
        this.data = result;
      })
      .catch((error) => {
        console.error("Error loading accounts: ", error);
      });
  }
}
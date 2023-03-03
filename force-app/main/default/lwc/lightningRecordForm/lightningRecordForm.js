import { LightningElement, api } from 'lwc';

export default class LightningRecordForm extends LightningElement {
    /*
        force:hasRecord - recordId
        force:hasSobjectName - objectAPIName
    */

    @api recordId;
    @api objectApiName;

}
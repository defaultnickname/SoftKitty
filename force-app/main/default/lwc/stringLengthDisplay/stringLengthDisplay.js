import { LightningElement, api } from 'lwc';

export default class StringLengthDisplay extends LightningElement {

    @api title;
    @api strings;

}
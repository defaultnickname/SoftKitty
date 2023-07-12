import { LightningElement, api } from 'lwc';
import sortStringEntries from '@salesforce/apex/StringUtilityController.sortStringEntries';

const DELAY = 300;

export default class ParentComponent extends LightningElement {

    text =  `Wlazł\nkotek\nna płotek\ni mruga\nładna to piosenka\nnie długa\nNie długa, nie krótka\nlecz w sam raz\nzaśpiewaj koteczku\njeszcze raz.`;
    descending = true
    stringEntriesSortedInTheBackend = [];
    delayTimeout;


    get stringsSplitByNewLine(){
        return this.text.split('\n');
    }

    get sortedStrings(){
        return this.stringsSplitByNewLine.toSorted(this.sortingFunction);
    }
    
    get sortingFunction(){
        return this.descending ? this.sortDescending : this.sortAscending;
    }

    changeText( event ){
        this.text = event.target.value;
        this.getEntries();
    }

    toggleOrder(){
        this.descending = !this.descending;
        this.getEntries();
    }

    sortAscending = (a,b) => a.length - b.length;

    sortDescending = (a,b) => b.length - a.length;

    get sortingIcon(){
        return this.descending ? 'utility:arrow_top' : 'utility:arrow_bottom';
    }

    get sortingLabel(){
        
        return this.descending ? 'Sort Descending' : 'Sort Ascending';
    }

    getEntries(){
        window.clearTimeout(this.delayTimeout);
        this.delayTimeout = setTimeout(() => {
            sortStringEntries({stringEntries:this.stringsSplitByNewLine, descending: this.descending}).then(odp=>{
                this.stringEntriesSortedInTheBackend = odp;
                console.log(this.stringEntriesSortedInTheBackend);
            })
            
        }, DELAY);
    }

    connectedCallback(){
      
        this.getEntries();
    
    }
}
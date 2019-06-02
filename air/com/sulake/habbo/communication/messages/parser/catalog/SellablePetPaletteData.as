//com.sulake.habbo.communication.messages.parser.catalog.SellablePetPaletteData

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SellablePetPaletteData {

        private var _type:int;
        private var _breedId:int;
        private var _paletteId:int;
        private var _sellable:Boolean;
        private var _rare:Boolean;

        public function SellablePetPaletteData(k:IMessageDataWrapper);

        public function get type():int;

        public function get breedId():int;

        public function get paletteId():int;

        public function get sellable():Boolean;

        public function get rare():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog


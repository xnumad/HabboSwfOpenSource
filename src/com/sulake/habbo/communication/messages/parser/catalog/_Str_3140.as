package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3140 
    {
        private var _type:int;
        private var _Str_3717:int;
        private var _paletteId:int;
        private var _sellable:Boolean;
        private var _rare:Boolean;

        public function _Str_3140(k:IMessageDataWrapper)
        {
            this._type = k.readInteger();
            this._Str_3717 = k.readInteger();
            this._paletteId = k.readInteger();
            this._sellable = k.readBoolean();
            this._rare = k.readBoolean();
        }

        public function get type():int
        {
            return this._type;
        }

        public function get breedId():int
        {
            return this._Str_3717;
        }

        public function get paletteId():int
        {
            return this._paletteId;
        }

        public function get sellable():Boolean
        {
            return this._sellable;
        }

        public function get rare():Boolean
        {
            return this._rare;
        }
    }
}

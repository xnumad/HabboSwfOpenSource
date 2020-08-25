package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FlatCategory 
    {
        private var _nodeId:int;
        private var _nodeName:String;
        private var _visible:Boolean;
        private var _automatic:Boolean;
        private var _Str_21646:String;
        private var _Str_13882:String;
        private var _Str_22231:Boolean;

        public function FlatCategory(k:IMessageDataWrapper)
        {
            this._nodeId = k.readInteger();
            this._nodeName = k.readString();
            this._visible = k.readBoolean();
            this._automatic = k.readBoolean();
            this._Str_21646 = k.readString();
            this._Str_13882 = k.readString();
            this._Str_22231 = k.readBoolean();
        }

        public function get nodeId():int
        {
            return this._nodeId;
        }

        public function get nodeName():String
        {
            return this._nodeName;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get automatic():Boolean
        {
            return this._automatic;
        }

        public function get _Str_13024():Boolean
        {
            return this._Str_22231;
        }

        public function get _Str_26018():String
        {
            return this._Str_21646;
        }

        public function get _Str_26359():String
        {
            return this._Str_13882;
        }

        public function get _Str_14718():String
        {
            return (this._Str_13882 == "") ? this._nodeName : (("${navigator.flatcategory.global." + this._Str_13882) + "}");
        }
    }
}

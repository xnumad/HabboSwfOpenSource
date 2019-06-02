package com.sulake.habbo.friendlist.domain
{
    import com.sulake.habbo.friendlist._Str_6180;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendlist.HabboFriendList;

    public class _Str_2740 
    {
        private var _id:int;
        private var _name:String;
        private var _Str_20054:String;
        private var _Str_21821:String;
        private var _Str_17873:_Str_6180;
        private var _Str_15618:Boolean;
        private var _selected:Boolean;
        private var _view:IWindowContainer;

        public function _Str_2740(k:HabboFriendList, _arg_2:int, _arg_3:_Str_6180, _arg_4:String, _arg_5:String, _arg_6:String)
        {
            this._id = _arg_2;
            this._name = _arg_4;
            this._Str_17873 = _arg_3;
            this._Str_20054 = _arg_5;
            this._Str_21821 = _arg_6;
            this._Str_17873.init(k);
        }

        public function setSelected(k:Boolean):void
        {
            if (k)
            {
                this._Str_15618 = false;
            }
            this._selected = k;
        }

        public function _Str_9276(k:Boolean):void
        {
            if (this.selected)
            {
                this._Str_15618 = false;
            }
            else
            {
                this._Str_15618 = k;
            }
        }

        public function get _Str_14035():Boolean
        {
            return this._Str_15618;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_24165():String
        {
            return this._Str_20054;
        }

        public function get _Str_22380():String
        {
            return this._Str_21821;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function get _Str_4621():_Str_6180
        {
            return this._Str_17873;
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function set view(k:IWindowContainer):void
        {
            this._view = k;
        }
    }
}

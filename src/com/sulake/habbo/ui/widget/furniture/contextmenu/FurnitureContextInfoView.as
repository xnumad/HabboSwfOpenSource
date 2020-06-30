package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.habbo.ui.widget.contextmenu.ButtonMenuView;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;

    public class FurnitureContextInfoView extends ButtonMenuView 
    {
        protected var _Str_2731:IRoomObject;
        protected var _title:String;

        public function FurnitureContextInfoView(k:IContextMenuParentWidget)
        {
            super(k);
        }

        public static function setup(k:FurnitureContextInfoView, _arg_2:IRoomObject, _arg_3:String=""):void
        {
            k._Str_2731 = _arg_2;
            k._title = _arg_3;
            _Str_8532(k);
        }


        protected function get _Str_26423():IRoomObject
        {
            return this._Str_2731;
        }

        override public function dispose():void
        {
            this._Str_2731 = null;
            super.dispose();
        }
    }
}

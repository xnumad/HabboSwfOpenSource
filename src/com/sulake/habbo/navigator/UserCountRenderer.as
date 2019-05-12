package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;

    public class UserCountRenderer 
    {
        public static const USERCOUNT:String = "usercount";

        private var _navigator:IHabboTransitionalNavigator;

        public function UserCountRenderer(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        public function dispose():void
        {
            this._navigator = null;
        }

        public function refreshUserCount(k:int, _arg_2:IWindowContainer, _arg_3:int, _arg_4:String, _arg_5:int, _arg_6:int):void
        {
            var _local_7:IWindowContainer = IWindowContainer(_arg_2.findChildByName(USERCOUNT));
            if (_local_7 == null)
            {
                _local_7 = IWindowContainer(this._navigator.getXmlWindow("grs_usercount"));
                _local_7.name = USERCOUNT;
                _local_7.x = _arg_5;
                _local_7.y = _arg_6;
                _arg_2.addChild(_local_7);
            }
            IInteractiveWindow(_local_7)._Str_2613 = _arg_4;
            var _local_8:ITextWindow = ITextWindow(_local_7.findChildByName("txt"));
            _local_8.text = ("" + _arg_3);
            var _local_9:String = this.getBgColor(k, _arg_3);
            this._Str_23351(_local_7, _local_9);
            _local_7.visible = true;
        }

        private function getBgColor(k:int, _arg_2:int):String
        {
            if (_arg_2 == 0)
            {
                return "b";
            }
            if (this._Str_18037(k, _arg_2, "red", 92))
            {
                return "r";
            }
            if (this._Str_18037(k, _arg_2, "orange", 80))
            {
                return "o";
            }
            if (this._Str_18037(k, _arg_2, "yellow", 50))
            {
                return "y";
            }
            return "g";
        }

        private function _Str_18037(k:int, _arg_2:int, _arg_3:String, _arg_4:int):Boolean
        {
            var _local_5:String = ("navigator.colorlimit." + _arg_3);
            var _local_6:int = this._navigator.getInteger(_local_5, _arg_4);
            var _local_7:int = ((k * _local_6) / 100);
            return _arg_2 >= _local_7;
        }

        private function _Str_23351(k:IWindowContainer, _arg_2:String):void
        {
            var _local_4:String;
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(k.findChildByName("usercount_bg"));
            if (_local_3.tags[0] != _arg_2)
            {
                _local_3.tags.splice(0, _local_3.tags.length);
                _local_3.tags.push(_arg_2);
                _local_4 = ("usercount_fixed_" + _arg_2);
                _local_3.bitmap = this._navigator._Str_3122(_local_4);
                _local_3.disposesBitmap = false;
                _local_3.invalidate();
            }
        }

        private function _Str_17821(k:IWindowContainer, _arg_2:String, _arg_3:Boolean):void
        {
            this._navigator.refreshButton(k, _arg_2, _arg_3, null, 0);
        }
    }
}


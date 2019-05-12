package com.sulake.habbo.avatar.view
{
    import com.sulake.habbo.avatar.HabboAvatarEditorManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;

    public class AvatarEditorNameSuggestionListRenderer 
    {
        private const _Str_11311:int = 5;
        private const _Str_11646:int = 5;

        private var _manager:HabboAvatarEditorManager;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _windowId:int = 0;
        private var _rect:Rectangle = null;

        public function AvatarEditorNameSuggestionListRenderer(k:HabboAvatarEditorManager)
        {
            this._manager = k;
        }

        public function dispose():void
        {
            this._manager = null;
        }

        public function render(k:Array, _arg_2:IWindowContainer):int
        {
            var _local_3:ITextWindow;
            var _local_7:IWindow;
            while (_arg_2.numChildren > 0)
            {
                _local_7 = _arg_2.removeChildAt(0);
                _local_7.dispose();
            }
            _arg_2.parent.invalidate();
            this._windowId = 0;
            this._offsetX = 0;
            this._offsetY = 0;
            this._rect = _arg_2.rectangle;
            this._rect.height = 150;
            var _local_4:int;
            while (_local_4 < k.length)
            {
                _local_3 = this._Str_16658((k[_local_4] as String));
                if (this._Str_6528(_local_3))
                {
                    _arg_2.addChild(_local_3);
                }
                else
                {
                    _local_3.dispose();
                }
                _local_4++;
            }
            var _local_5:int = _arg_2.numChildren;
            if (_local_5 == 0)
            {
                return 0;
            }
            var _local_6:IWindow = _arg_2.getChildAt((_arg_2.numChildren - 1));
            return _local_6.bottom;
        }

        private function _Str_6528(k:IWindow):Boolean
        {
            if (((k.width > this._rect.width) || (k.width < 2)))
            {
                return false;
            }
            if ((this._offsetY + k.height) > this._rect.height)
            {
                return false;
            }
            if ((this._offsetX + k.width) > this._rect.width)
            {
                this._offsetX = 0;
                this._offsetY = (this._offsetY + (k.height + this._Str_11646));
                return this._Str_6528(k);
            }
            k.x = (k.x + this._offsetX);
            k.y = (k.y + this._offsetY);
            this._offsetX = (this._offsetX + (k.width + this._Str_11311));
            return true;
        }

        private function _Str_16658(k:String):ITextWindow
        {
            var _local_2:ITextWindow = (this._manager.windowManager.buildFromXML(XML(HabboAvatarEditorCom.avatar_editor_name_change_item)) as ITextWindow);
            if (_local_2 == null)
            {
                return null;
            }
            _local_2.text = k;
            return _local_2;
        }
    }
}

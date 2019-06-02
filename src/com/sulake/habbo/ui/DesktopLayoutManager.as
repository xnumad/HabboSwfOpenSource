package com.sulake.habbo.ui
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IDisplayObjectWrapper;

    public class DesktopLayoutManager 
    {
        private static const ROOM_VIEW:String = "room_view";
        private static const ROOM_NEW_CHAT:String = "room_new_chat";
        private static const ROOM_WIDGET:String = "room_widget";
        private static const _Str_17686:int = 47;

        private var _layoutContainer:IWindowContainer;


        public function dispose():void
        {
            if (this._layoutContainer != null)
            {
                this._layoutContainer.dispose();
            }
        }

        public function _Str_22537(k:XML, _arg_2:IHabboWindowManager, _arg_3:IHabboConfigurationManager):void
        {
            var _local_5:IWindow;
            var _local_7:int;
            if (((k == null) || (_arg_2 == null)))
            {
                throw (new Error("Unable to set room desktop layout."));
            }
            this._layoutContainer = (_arg_2.buildFromXML(k, 0) as IWindowContainer);
            if (this._layoutContainer == null)
            {
                throw (new Error("Failed to build layout from XML."));
            }
            this._layoutContainer.width = this._layoutContainer.desktop.width;
            this._layoutContainer.height = this._layoutContainer.desktop.height;
            var _local_4:IWindowContainer = (this._layoutContainer.desktop as IWindowContainer);
            _local_4.addChild(this._layoutContainer);
            this._layoutContainer.findChildByTag("room_widget_infostand").y = (this._layoutContainer.findChildByTag("room_widget_infostand").y - _Str_17686);
            var _local_6:int;
            while (_local_6 < this._layoutContainer.numChildren)
            {
                _local_5 = this._layoutContainer.getChildAt(_local_6);
                _local_7 = ((WindowParam.WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM) || (WindowParam.WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_RIGHT));
                if (_local_5.testParamFlag(_local_7))
                {
                    _local_5.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_22282);
                }
                _local_6++;
            }
        }

        private function _Str_22282(k:WindowEvent):void
        {
            var _local_2:IWindowContainer = (k.window as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.numChildren != 1)
            {
                return;
            }
            var _local_3:IWindow = _local_2.getChildAt(0);
            if (_local_3 == null)
            {
                return;
            }
            _local_2.width = _local_3.width;
            _local_2.height = _local_3.height;
        }

        private function _Str_20326(k:String, _arg_2:IWindow):IWindowContainer
        {
            var _local_4:String;
            var _local_7:IWindowContainer;
            var _local_8:IWindowContainer;
            if (_arg_2 == null)
            {
                return null;
            }
            if (((k == RoomWidgetEnum.HIGH_SCORE_DISPLAY) || (k == RoomWidgetEnum.WORD_QUIZZ)))
            {
                _local_7 = (this._layoutContainer.getChildByName("background_widgets") as IWindowContainer);
                return _local_7;
            }
            if (k == RoomWidgetEnum.CHAT_INPUT_WIDGET)
            {
                _local_8 = (_arg_2.desktop as IWindowContainer);
                return _local_8;
            }
            var _local_3:Array = _arg_2.tags;
            var _local_5:int;
            while (_local_5 < _local_3.length)
            {
                if (String(_local_3[_local_5]).indexOf(ROOM_WIDGET) == 0)
                {
                    _local_4 = (_local_3[_local_5] as String);
                    break;
                }
                _local_5++;
            }
            if (_local_4 == null)
            {
                return null;
            }
            var _local_6:IWindowContainer = (this._layoutContainer.getChildByTag(_local_4) as IWindowContainer);
            return _local_6;
        }

        public function _Str_24018(k:String, _arg_2:IWindow):Boolean
        {
            if (_arg_2 == null)
            {
                return false;
            }
            var _local_3:IWindowContainer = this._Str_20326(k, _arg_2);
            if (_local_3 == null)
            {
                return false;
            }
            if (k == RoomWidgetEnum.CHAT_INPUT_WIDGET)
            {
                _local_3.addChild(_arg_2);
                return true;
            }
            _arg_2.x = 0;
            _arg_2.y = 0;
            _local_3.addChild(_arg_2);
            _local_3.width = _arg_2.width;
            _local_3.height = _arg_2.height;
            return true;
        }

        public function window2(k:String, _arg_2:IWindow):void
        {
            var _local_3:IWindowContainer = this._Str_20326(k, _arg_2);
            if (_local_3 != null)
            {
                _local_3.removeChild(_arg_2);
            }
        }

        public function _Str_24675(k:IWindow):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:IWindowContainer = (this._layoutContainer.getChildByTag(ROOM_VIEW) as IWindowContainer);
            if (_local_2 == null)
            {
                return false;
            }
            _local_2.addChild(k);
            return true;
        }

        public function get _Str_16760():Rectangle
        {
            if (this._layoutContainer == null)
            {
                return null;
            }
            var k:IWindowContainer = (this._layoutContainer.findChildByTag(ROOM_VIEW) as IWindowContainer);
            if (!k)
            {
                return null;
            }
            var _local_2:Rectangle = k.rectangle;
            if (!_local_2)
            {
                return null;
            }
            _local_2.offset(this._layoutContainer.x, this._layoutContainer.y);
            return _local_2;
        }

        public function _Str_19928():IWindow
        {
            if (this._layoutContainer == null)
            {
                return null;
            }
            var k:IWindowContainer = (this._layoutContainer.findChildByTag(ROOM_VIEW) as IWindowContainer);
            if (((!(k == null)) && (k.numChildren > 0)))
            {
                return k.getChildAt(0);
            }
            return null;
        }

        public function _Str_10173():IDisplayObjectWrapper
        {
            if (this._layoutContainer == null)
            {
                return null;
            }
            return this._layoutContainer.findChildByTag(ROOM_NEW_CHAT) as IDisplayObjectWrapper;
        }
    }
}

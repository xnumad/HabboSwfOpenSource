package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.QuestDailyMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_5085;
    import com.sulake.habbo.communication.messages.parser.quest.QuestDailyParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_4916;
    import com.sulake.habbo.communication.messages.outgoing._Str_223._Str_7541;

    public class DailyQuestElementHandler implements IElementHandler, IFloatingElement, IDisposable 
    {
        private var _landingView:HabboLandingView;
        private var _widget:GenericWidget;
        private var _window:IWindowContainer;
        private var _container:IWindowContainer;
        private var _data:_Str_2455;
        private var _easyQuestCount:int;
        private var _hardQuestCount:int;
        private var _index:int;
        private var _isFloating:Boolean = false;
        private var _disposed:Boolean = false;
        private var _campaignCode:String = "";
        private var _chainCode:String = "";


        public static function _Str_5055(k:IWindowContainer, _arg_2:int):void
        {
            var _local_5:IWindow;
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < k.numChildren)
            {
                _local_5 = k.getChildAt(_local_4);
                _local_5.x = _local_3;
                _local_3 = (_local_3 + (_local_5.width + _arg_2));
                _local_4++;
            }
        }


        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._widget = _arg_4;
            this._landingView = k;
            this._window = (_arg_2 as IWindowContainer);
            if (_arg_3.length > 2)
            {
                this._isFloating = (_arg_3[2] == "true");
            }
            if (_arg_3.length > 3)
            {
                _arg_2.x = int(_arg_3[3]);
            }
            if (_arg_3.length > 4)
            {
                _arg_2.y = int(_arg_3[4]);
            }
            if (_arg_3.length > 5)
            {
                this._campaignCode = _arg_3[5];
            }
            if (_arg_3.length > 6)
            {
                this._chainCode = _arg_3[6];
            }
            k.communicationManager.addHabboConnectionMessageEvent(new QuestDailyMessageEvent(this._Str_17705));
            this._container = (_arg_2 as IWindowContainer);
            this._container.findChildByName("accept_button").procedure = this._Str_17327;
            this._container.findChildByName("go_button").procedure = this._Str_5735;
            this._container.findChildByName("next_quest_region").procedure = this._Str_8477;
            this._container.findChildByName("cancel_quest_region").procedure = this._Str_8215;
            this._container.findChildByName("easy_region").procedure = this._Str_16091;
            this._container.findChildByName("hard_region").procedure = this._Str_18792;
        }

        public function dispose():void
        {
            this._landingView = null;
            this._disposed = true;
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return this._isFloating;
        }

        public function refresh():void
        {
            this._index = 0;
            this._landingView.send(new _Str_5085(true, 0));
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_17705(k:IMessageEvent):void
        {
            var _local_2:QuestDailyParser = QuestDailyParser(k.parser);
            this._data = _local_2.quest;
            this._easyQuestCount = _local_2._Str_20037;
            this._hardQuestCount = _local_2._Str_19915;
            this.refreshContent();
        }

        private function refreshContent():void
        {
            this._container.findChildByName("caption_txt").caption = ((this._data) ? this._Str_14198("chaincaption") : this.getText("landing.view.quest.currenttask.alldone.caption"));
            this._container.findChildByName("accept_button").visible = ((this._data) && (!(this._data.accepted)));
            this._container.findChildByName("next_quest_region").visible = (((this._data) && (!(this._data.accepted))) && (((this._data.easy) ? this._easyQuestCount : this._hardQuestCount) > 1));
            this._container.findChildByName("next_quest_txt").caption = this.getText(("landing.view.quest.nextquest." + (((this._data) && (this._data.easy)) ? "easy" : "hard")));
            this._container.findChildByName("cancel_quest_region").visible = ((this._data) && (this._data.accepted));
            this._container.findChildByName("current_quest_border").visible = ((this._data) && (this._data.accepted));
            if (this._data)
            {
                this._landingView.localizationManager.registerParameter("landing.view.quest.currenttask", "task", this._Str_10470());
            }
            var k:IWindowContainer = IWindowContainer(this._container.findChildByName("difficulty_container"));
            var _local_2:int = (k.x + k.width);
            k.visible = ((((this._data) && (!(this._data.accepted))) && (this._easyQuestCount > 0)) && (this._hardQuestCount > 0));
            this._Str_10427("easy_region", ((this._data) && (!(this._data.easy))));
            this._Str_10427("hard_region", ((this._data) && (this._data.easy)));
            _Str_5055(k, 5);
            k.width = (k.findChildByName("hard_region").x + k.findChildByName("hard_region").width);
            k.x = (_local_2 - k.width);
        }

        private function _Str_10427(k:String, _arg_2:Boolean):void
        {
            var _local_3:IWindowContainer = IWindowContainer(this._container.findChildByName(k));
            var _local_4:ITextWindow = ITextWindow(_local_3.findChildByName("label_txt"));
            _local_4.width = _local_4.textWidth;
            _local_4.underline = _arg_2;
            _local_3.width = _local_4.width;
        }

        private function _Str_17892(k:String):String
        {
            return (((("quests." + this._data._Str_6549) + ".") + this._data._Str_19427) + ".") + k;
        }

        private function _Str_14198(k:String):String
        {
            var _local_2:String = this._Str_17892(k);
            return ("${" + _local_2) + "}";
        }

        private function getText(k:String):String
        {
            return ("${" + k) + "}";
        }

        private function _Str_5735(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.goToRoom();
            }
        }

        private function _Str_16091(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_7311(true);
            }
        }

        private function _Str_18792(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._Str_7311(false);
            }
        }

        public function _Str_10470():String
        {
            var k:* = (this._data._Str_5688() + ".name");
            return ("${" + k) + "}";
        }

        private function _Str_17327(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.send(new _Str_4916(this._data.id));
            }
        }

        private function _Str_8477(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._index++;
                this._Str_7311(this._data.easy);
            }
        }

        private function _Str_8215(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.send(new _Str_7541());
            }
        }

        private function _Str_7311(k:Boolean):void
        {
            this._landingView.send(new _Str_5085(k, this._index));
        }
    }
}

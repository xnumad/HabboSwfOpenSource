package com.sulake.habbo.ui.widget.poll
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent;
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.core.window.events.WindowEvent;

    public class RoomPollWidget extends RoomWidgetBase
    {
        private var _Str_4484:Map;

        public function RoomPollWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null, _arg_4:IHabboLocalizationManager=null)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_4484 = new Map();
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:PollSession;
            if (disposed)
            {
                return;
            }
            if (this._Str_4484 != null)
            {
                k = this._Str_4484.length;
                _local_2 = 0;
                while (_local_2 < k)
                {
                    _local_3 = (this._Str_4484.getWithIndex(0) as PollSession);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    }
                    _local_2++;
                }
                this._Str_4484.dispose();
                this._Str_4484 = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(RoomWidgetPollUpdateEvent.RWPUW_OFFER, this._Str_21632);
            k.addEventListener(RoomWidgetPollUpdateEvent.ERROR, this._Str_21733);
            k.addEventListener(RoomWidgetPollUpdateEvent.RWPUW_CONTENT, this._Str_21584);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetPollUpdateEvent.RWPUW_OFFER, this._Str_21632);
            k.removeEventListener(RoomWidgetPollUpdateEvent.ERROR, this._Str_21733);
            k.removeEventListener(RoomWidgetPollUpdateEvent.RWPUW_CONTENT, this._Str_21584);
        }

        private function _Str_21632(k:Event):void
        {
            var _local_2:int = RoomWidgetPollUpdateEvent(k).id;
            var _local_3:PollSession = (this._Str_4484.getValue(_local_2) as PollSession);
            var _local_4:String = RoomWidgetPollUpdateEvent(k).summary;
            var _local_5:String = RoomWidgetPollUpdateEvent(k).headline;
            if (!_local_3)
            {
                _local_3 = new PollSession(_local_2, this);
                this._Str_4484.add(_local_2, _local_3);
                _local_3._Str_6059(_local_5, _local_4);
            }
            else
            {
                Logger.log("Poll with given id already exists!");
                _local_3._Str_6059(_local_5, _local_4);
            }
        }

        private function _Str_21733(e:Event):void
        {
            windowManager.alert("${win_error}", RoomWidgetPollUpdateEvent(e).summary, 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }

        private function _Str_21584(k:Event):void
        {
            var _local_3:int;
            var _local_4:PollSession;
            var _local_2:RoomWidgetPollUpdateEvent = (k as RoomWidgetPollUpdateEvent);
            if (_local_2 != null)
            {
                _local_3 = _local_2.id;
                _local_4 = (this._Str_4484.getValue(_local_3) as PollSession);
                if (_local_4 != null)
                {
                    _local_4._Str_24948(_local_2._Str_6013, _local_2._Str_5838, _local_2._Str_5643, _local_2._Str_6196);
                }
            }
        }

        public function _Str_24255(k:int):void
        {
            var _local_2:PollSession = (this._Str_4484.getValue(k) as PollSession);
            if (_local_2 != null)
            {
                _local_2._Str_24541();
                _local_2.dispose();
                this._Str_4484.remove(k);
            }
        }

        public function _Str_12823(k:int):void
        {
            var _local_2:PollSession = (this._Str_4484.getValue(k) as PollSession);
            if (_local_2 != null)
            {
                _local_2.dispose();
                this._Str_4484.remove(k);
            }
        }
    }
}

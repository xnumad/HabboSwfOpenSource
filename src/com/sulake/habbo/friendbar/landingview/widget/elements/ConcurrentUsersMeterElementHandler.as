package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.quest.ConcurrentUsersGoalProgressMessageEvent;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class ConcurrentUsersMeterElementHandler implements IElementHandler, IFloatingElement 
    {
        private var _image:IStaticBitmapWrapperWindow;
        private var _state:int;
        private var _userCount:int;
        private var _userCountGoal:int;


        public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            this._image = IStaticBitmapWrapperWindow(_arg_2);
            var _local_5:String = _arg_3[1];
            this._image.assetUri = _local_5;
            this._image.x = ((_arg_3.length > 2) ? int(_arg_3[2]) : 0);
            this._image.y = ((_arg_3.length > 3) ? int(_arg_3[3]) : 0);
            Logger.log(("Init Concurrent users meter: " + _local_5));
            k.communicationManager.addHabboConnectionMessageEvent(new ConcurrentUsersGoalProgressMessageEvent(this._Str_16345));
        }

        public function refresh():void
        {
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return true;
        }

        private function _Str_16345(k:ConcurrentUsersGoalProgressMessageEvent):void
        {
            this._state = k.getParser().state;
            this._userCount = k.getParser().userCount;
            this._userCountGoal = k.getParser()._Str_21827;
            var _local_2:int = ((this._userCount / this._userCountGoal) * 100);
            _local_2 = Math.max(20, Math.min(100, _local_2));
            _local_2 = (Math.floor((_local_2 / 10)) * 10);
            var _local_3:String = ("challenge_meter_" + _local_2);
            this._image.assetUri = (("${image.library.url}reception/" + _local_3) + ".png");
            Logger.log(("Updating meter: " + _local_3));
        }
    }
}

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IFloatingElement;
    import com.sulake.habbo.communication.messages.incoming._Str_87._Str_8179;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents._Str_4585;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges._Str_7854;

    public class RequestBadgeButtonElementHandler extends AbstractButtonElementHandler implements IFloatingElement 
    {
        private var _badgeRequestCode:String;
        private var _isFloating:Boolean = true;


        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            this._badgeRequestCode = _arg_3[2];
            _arg_2.x = int(_arg_3[3]);
            _arg_2.y = int(_arg_3[4]);
            if (_arg_3.length > 5)
            {
                this._isFloating = (_arg_3[5] == "true");
            }
            k.communicationManager.addHabboConnectionMessageEvent(new _Str_8179(this._Str_9863));
            k.communicationManager.addHabboConnectionMessageEvent(new _Str_4585(this._Str_23794));
        }

        override protected function onClick():void
        {
            landingView.requestBadge(this._badgeRequestCode);
            landingView.tracking.trackGoogle("landingView", ("click_requestbadge_" + this._badgeRequestCode));
        }

        override public function refresh():void
        {
            super.refresh();
            landingView.send(new _Str_7854(this._badgeRequestCode));
        }

        public function _Str_7806(k:Boolean):Boolean
        {
            return this._isFloating;
        }

        private function _Str_9863(k:_Str_8179):void
        {
            if (k.getParser()._Str_25181 == this._badgeRequestCode)
            {
                window.visible = (!(k.getParser()._Str_25366));
            }
        }

        private function _Str_23794(k:_Str_4585):void
        {
            if (window)
            {
                landingView.send(new _Str_7854(this._badgeRequestCode));
            }
        }
    }
}

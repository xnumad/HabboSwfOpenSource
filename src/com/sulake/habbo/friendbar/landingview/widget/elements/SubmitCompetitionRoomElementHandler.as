package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.communication.messages.incoming.competition._Str_8237;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_10525;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_12123;

    public class SubmitCompetitionRoomElementHandler extends AbstractButtonElementHandler 
    {
        private var _submittedKey:String;
        private var _goalCode:String;
        private var _isPartOf:Boolean;
        private var _targetId:int;


        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            this._submittedKey = _arg_3[2];
            this._goalCode = _arg_3[3];
            k.communicationManager.addHabboConnectionMessageEvent(new _Str_8237(this._Str_9863));
        }

        override public function refresh():void
        {
            super.refresh();
            landingView.send(new _Str_10525(this._goalCode));
        }

        override protected function onClick():void
        {
            landingView.questEngine.reenableRoomCompetitionWindow();
            if (this._isPartOf)
            {
                landingView.navigator.goToPrivateRoom(this._targetId);
                landingView.tracking.trackGoogle("landingView", "click_submittedroom");
            }
            else
            {
                landingView.send(new _Str_12123());
                landingView.tracking.trackGoogle("landingView", "click_startsubmit");
            }
        }

        private function _Str_9863(k:_Str_8237):void
        {
            this._isPartOf = k.getParser()._Str_25348;
            this._targetId = k.getParser()._Str_10760;
            if (this._isPartOf)
            {
                window.caption = (("${" + this._submittedKey) + "}");
            }
        }
    }
}

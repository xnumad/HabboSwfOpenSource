package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.communication.messages.incoming.competition._Str_9217;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.communication.messages.outgoing._Str_301._Str_9816;

    public class CustomTimerElementHandler extends AbstractTimerElementHandler 
    {
        private var _timeStr:String;


        override public function initialize(k:HabboLandingView, _arg_2:IWindow, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(k, _arg_2, _arg_3, _arg_4);
            this._timeStr = _arg_3[6];
            k.communicationManager.addHabboConnectionMessageEvent(new _Str_9217(this._Str_24489));
        }

        override public function refresh():void
        {
            landingView.send(new _Str_9816(this._timeStr));
        }

        private function _Str_24489(k:_Str_9217):void
        {
            if (k.getParser()._Str_23288 == this._timeStr)
            {
                _Str_14169(k.getParser()._Str_25497);
            }
        }
    }
}

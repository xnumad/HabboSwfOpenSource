package com.sulake.habbo.moderation
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.sulake.core.window.events.WindowEvent;

    public class OpenExternalLink 
    {
        private var _url:String;

        public function OpenExternalLink(k:ModerationManager, _arg_2:IWindow, _arg_3:String)
        {
            _arg_2.procedure = this.onClick;
            this._url = _arg_3;
        }

        private function onClick(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            navigateToURL(new URLRequest(this._url), "_blank");
        }
    }
}

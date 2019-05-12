package com.sulake.habbo.help
{
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets._Str_4466;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class HabboWayController 
    {
        private const _Str_7835:int = 0;

        private var _pageCount:int = 0;
        private var _currentPage:int = 0;
        private var _habboHelp:HabboHelp;
        private var _dialog:_Str_2784;
        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;

        public function HabboWayController(k:HabboHelp)
        {
            this._habboHelp = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.closeWindow();
                if (this._habboHelp)
                {
                    this._habboHelp = null;
                }
                this._disposed = true;
            }
        }

        private function get _Str_16191():int
        {
            return this._habboHelp.getInteger("help.habboway.page.count", 6);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function showHabboWay():void
        {
            this.closeWindow();
            this._dialog = this._habboHelp._Str_4804("habbo_way");
            this._window = IWindowContainer(this._dialog._Str_2429);
            this._window.procedure = this._Str_3061;
            _Str_4466(IWidgetWindow(this._window.findChildByName("page_widget")).widget).size = this._Str_16191;
            this._Str_7910(this._Str_7835);
        }

        public function closeWindow():void
        {
            this._window = null;
            if (this._dialog)
            {
                this._dialog.dispose();
                this._dialog = null;
            }
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._disposed) || (!(this._window))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this.closeWindow();
                    return;
                case "next_button":
                    this._Str_7910(Math.min(this._Str_16191, (this._currentPage + 1)));
                    this._habboHelp.trackGoogle("habboWay", ("clickNextPage_" + this._currentPage));
                    return;
                case "back_button":
                case "previous_button":
                    this._Str_7910(Math.max(this._Str_7835, (this._currentPage - 1)));
                    this._habboHelp.trackGoogle("habboWay", ("clickPrevPage_" + this._currentPage));
                    return;
                case "quiz_button":
                    this._habboHelp.trackGoogle("habboWay", "clickQuiz");
                    this._habboHelp._Str_16933();
                    return;
            }
        }

        private function _Str_7910(k:int):void
        {
            this._currentPage = k;
            if (this._currentPage < this._Str_16191)
            {
                if (this._currentPage == this._Str_7835)
                {
                    this._window.findChildByName("previous_button").visible = false;
                }
                else
                {
                    this._window.findChildByName("previous_button").visible = true;
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("illustration")).assetUri = (("${image.library.url}habboway/page_" + this._currentPage) + ".png");
                IStaticBitmapWrapperWindow(this._window.findChildByName("dove_image")).assetUri = "help_habboway_dove_off";
                _Str_4466(IWidgetWindow(this._window.findChildByName("page_widget")).widget).position = (this._currentPage + 1);
                this._window.findChildByName("correct_title").caption = (("${habbo.way.page." + this._currentPage) + ".correct.title}");
                this._window.findChildByName("correct_description").caption = (("${habbo.way.page." + this._currentPage) + ".correct.description}");
                this._window.findChildByName("wrong_title").caption = (("${habbo.way.page." + this._currentPage) + ".wrong.title}");
                this._window.findChildByName("wrong_description").caption = (("${habbo.way.page." + this._currentPage) + ".wrong.description}");
                this._window.findChildByName("page_container").visible = true;
                this._window.findChildByName("final_page").visible = false;
                this._window.findChildByName("page_container").invalidate();
            }
            else
            {
                IStaticBitmapWrapperWindow(this._window.findChildByName("illustration")).assetUri = "${image.library.url}habboway/page_end.png";
                IStaticBitmapWrapperWindow(this._window.findChildByName("dove_image")).assetUri = "help_habboway_dove_on";
                _Str_4466(IWidgetWindow(this._window.findChildByName("page_widget")).widget).position = 0;
                this._window.findChildByName("page_container").visible = false;
                this._window.findChildByName("final_page").visible = true;
                this._window.findChildByName("final_page").invalidate();
            }
        }
    }
}



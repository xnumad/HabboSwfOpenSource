package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets._Str_4466;
    import com.sulake.core.window.components.IWidgetWindow;

    public class SafetyBookletController implements IDisposable 
    {
        private const _Str_7835:int = 0;
        private const _Str_20665:int = 7;

        private var _habboHelp:HabboHelp;
        private var _dialog:_Str_2784;
        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _currentPage:int = 0;

        public function SafetyBookletController(k:HabboHelp)
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

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_24968():void
        {
            this.closeWindow();
            this._dialog = this._habboHelp._Str_4804("safety_booklet");
            this._window = IWindowContainer(this._dialog._Str_2429);
            this._window.procedure = this._Str_3061;
            this._Str_7910(this._Str_7835);
            this._habboHelp.tracking.trackEventLog("Quiz", "", "talent.quiz.open");
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
                    this._Str_7910(Math.min(this._Str_20665, (this._currentPage + 1)));
                    this._habboHelp.tracking.trackEventLog("Quiz", ("" + this._currentPage), "talent.quiz.change_page");
                    this._habboHelp.trackGoogle("safetyBooklet", ("clickNextPage_" + this._currentPage));
                    return;
                case "back_button":
                case "previous_button":
                    this._Str_7910(Math.max(this._Str_7835, (this._currentPage - 1)));
                    this._habboHelp.tracking.trackEventLog("Quiz", ("" + this._currentPage), "talent.quiz.change_page");
                    this._habboHelp.trackGoogle("safetyBooklet", ("clickPrevPage_" + this._currentPage));
                    return;
                case "quiz_button":
                    this._habboHelp.trackGoogle("safetyBooklet", "clickQuiz");
                    this._habboHelp._Str_14041();
                    return;
                case "ok_button":
                    this._habboHelp.trackGoogle("safetyBooklet", "clickOk");
                    this._habboHelp._Str_14041();
                    this._habboHelp._Str_21195();
                    return;
            }
        }

        private function _Str_7910(k:int):void
        {
            this._currentPage = k;
            this._window.findChildByName("safety.quiz.explanation").visible = (!(this._habboHelp._Str_19563));
            if (this._currentPage < this._Str_20665)
            {
                if (this._currentPage == this._Str_7835)
                {
                    this._window.findChildByName("previous_button").visible = false;
                }
                else
                {
                    this._window.findChildByName("previous_button").visible = true;
                }
                IStaticBitmapWrapperWindow(this._window.findChildByName("illustration")).assetUri = (("${image.library.url}safetyquiz/page_" + this._currentPage) + ".png");
                IStaticBitmapWrapperWindow(this._window.findChildByName("safety_image")).assetUri = "${image.library.url}safetyquiz/safety_off.png";
                _Str_4466(IWidgetWindow(this._window.findChildByName("page_widget")).widget).position = (this._currentPage + 1);
                this._window.findChildByName("title").caption = (("${safety.booklet.page." + this._currentPage) + ".title}");
                this._window.findChildByName("description").caption = (("${safety.booklet.page." + this._currentPage) + ".description}");
                this._window.findChildByName("page_container").visible = true;
                this._window.findChildByName("final_page").visible = false;
                this._window.findChildByName("final_page_no_questions").visible = false;
                this._window.findChildByName("page_container").invalidate();
            }
            else
            {
                IStaticBitmapWrapperWindow(this._window.findChildByName("illustration")).assetUri = "${image.library.url}safetyquiz/page_end.png";
                IStaticBitmapWrapperWindow(this._window.findChildByName("safety_image")).assetUri = "${image.library.url}safetyquiz/safety_on.png";
                _Str_4466(IWidgetWindow(this._window.findChildByName("page_widget")).widget).position = 0;
                this._window.findChildByName("page_container").visible = false;
                if (this._habboHelp._Str_19563)
                {
                    this._window.findChildByName("final_page_no_questions").visible = true;
                    this._window.findChildByName("final_page_no_questions").invalidate();
                }
                else
                {
                    this._window.findChildByName("final_page").visible = true;
                    this._window.findChildByName("final_page").invalidate();
                }
            }
        }
    }
}

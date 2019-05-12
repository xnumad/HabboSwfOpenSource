package com.sulake.habbo.avatar.legs
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class LegsView extends CategoryBaseView implements IAvatarEditorCategoryView 
    {
        public function LegsView(k:IAvatarEditorCategoryModel)
        {
            super(k);
        }

        override public function init():void
        {
            if (!window)
            {
                window = (_Str_2307.controller.view.getCategoryContainer(AvatarEditorFigureCategory.LEGS) as IWindowContainer);
                window.visible = false;
                window.procedure = this._Str_3328;
            }
            _Str_2367 = true;
            if (((_Str_2307) && (_Str_2889 == "")))
            {
                _Str_2307.switchCategory(FigureData.LG);
            }
        }

        public function switchCategory(k:String):void
        {
            if (window == null)
            {
                return;
            }
            if (window.disposed)
            {
                return;
            }
            k = ((k == "") ? _Str_2889 : k);
            _Str_3905(_Str_2851);
            switch (k)
            {
                case FigureData.LG:
                    _Str_2851 = "tab_pants";
                    break;
                case FigureData.SH:
                    _Str_2851 = "tab_shoes";
                    break;
                case FigureData.WA:
                    _Str_2851 = "tab_belts";
                    break;
                default:
                    throw (new Error((('[LegsView] Unknown item category: "' + k) + '"')));
            }
            _Str_2889 = k;
            _Str_3621(_Str_2851);
            if (!_Str_2367)
            {
                this.init();
            }
            updateGridView(_Str_2889);
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "tab_pants":
                        this.switchCategory(FigureData.LG);
                        break;
                    case "tab_shoes":
                        this.switchCategory(FigureData.SH);
                        break;
                    case "tab_belts":
                        this.switchCategory(FigureData.WA);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    switch (_arg_2.name)
                    {
                        case "tab_pants":
                        case "tab_shoes":
                        case "tab_belts":
                            _Str_3621(_arg_2.name);
                            break;
                    }
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        switch (_arg_2.name)
                        {
                            case "tab_pants":
                            case "tab_shoes":
                            case "tab_belts":
                                if (_Str_2851 != _arg_2.name)
                                {
                                    _Str_3905(_arg_2.name);
                                }
                                return;
                        }
                    }
                }
            }
        }
    }
}

package com.sulake.habbo.avatar.torso
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.figuredata.FigureData;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TorsoView extends CategoryBaseView implements IAvatarEditorCategoryView 
    {
        public function TorsoView(k:TorsoModel)
        {
            super(k);
        }

        override public function init():void
        {
            if (!window)
            {
                window = (_Str_2307.controller.view.getCategoryContainer(AvatarEditorFigureCategory.TORSO) as IWindowContainer);
                window.visible = false;
                window.procedure = this._Str_3328;
            }
            _Str_2367 = true;
            if (((_Str_2307) && (_Str_2889 == "")))
            {
                _Str_2307.switchCategory(FigureData.CH);
            }
        }

        override public function dispose():void
        {
            super.dispose();
            _Str_2307 = null;
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
                case FigureData.CH:
                    _Str_2851 = "tab_shirt";
                    break;
                case FigureData.CC:
                    _Str_2851 = "tab_jacket";
                    break;
                case FigureData.CHEST_PRINTS:
                    _Str_2851 = "tab_prints";
                    break;
                case FigureData.CHEST_ACCESSORIES:
                    _Str_2851 = "tab_accessories";
                    break;
                default:
                    throw (new Error((('[TorsoView] Unknown item category: "' + k) + '"')));
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
                    case "tab_jacket":
                        this.switchCategory(FigureData.CC);
                        break;
                    case "tab_shirt":
                        this.switchCategory(FigureData.CH);
                        break;
                    case "tab_accessories":
                        this.switchCategory(FigureData.CHEST_ACCESSORIES);
                        break;
                    case "tab_prints":
                        this.switchCategory(FigureData.CHEST_PRINTS);
                        break;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    switch (_arg_2.name)
                    {
                        case "tab_jacket":
                        case "tab_prints":
                        case "tab_shirt":
                        case "tab_accessories":
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
                            case "tab_jacket":
                            case "tab_prints":
                            case "tab_shirt":
                            case "tab_accessories":
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

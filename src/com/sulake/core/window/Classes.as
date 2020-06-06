package com.sulake.core.window
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.components.ActivatorController;
    import com.sulake.core.window.components.BackgroundController;
    import com.sulake.core.window.components.BorderController;
    import com.sulake.core.window.components.BoxSizerController;
    import com.sulake.core.window.components.BubbleController;
    import com.sulake.core.window.components.ButtonController;
    import com.sulake.core.window.components.ButtonGroupController;
    import com.sulake.core.window.components.BitmapWrapperController;
    import com.sulake.core.window.components.CheckboxController;
    import com.sulake.core.window.components.ContainerController;
    import com.sulake.core.window.components.ContainerButtonController;
    import com.sulake.core.window.components.CloseButtonController;
    import com.sulake.core.window.components.DisplayObjectWrapperController;
    import com.sulake.core.window.components.DragBarController;
    import com.sulake.core.window.components.DropMenuController;
    import com.sulake.core.window.components.DropMenuItemController;
    import com.sulake.core.window.components.DropListController;
    import com.sulake.core.window.components.DropListItemController;
    import com.sulake.core.window.components.FormattedTextController;
    import com.sulake.core.window.components.FrameController;
    import com.sulake.core.window.components.HeaderController;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.window.components.IconController;
    import com.sulake.core.window.components.ItemListController;
    import com.sulake.core.window.components.ItemGridController;
    import com.sulake.core.window.components.TextLabelController;
    import com.sulake.core.window.components.TextLinkController;
    import com.sulake.core.window.components.PasswordFieldController;
    import com.sulake.core.window.components.RadioButtonController;
    import com.sulake.core.window.components.RegionController;
    import com.sulake.core.window.components.ScalerController;
    import com.sulake.core.window.components.ScrollBarController;
    import com.sulake.core.window.components.ScrollableItemListWindow;
    import com.sulake.core.window.components.ScrollableItemGridWindow;
    import com.sulake.core.window.components.SelectorController;
    import com.sulake.core.window.components.SelectorListController;
    import com.sulake.core.window.components.StaticBitmapController;
    import com.sulake.core.window.components.TabButtonController;
    import com.sulake.core.window.components.TabContainerController;
    import com.sulake.core.window.components.TabContextController;
    import com.sulake.core.window.components.TextController;
    import com.sulake.core.window.components.TextFieldController;
    import com.sulake.core.window.components.TooltipController;
    import com.sulake.core.window.components.WidgetWindowController;
    import com.sulake.core.window.components.*;

    public class Classes 
    {
        protected static var _windowClassTable:Dictionary;


        public static function init():void
        {
            if (!_windowClassTable)
            {
                _windowClassTable = new Dictionary();
                _windowClassTable[WindowType.WINDOW_TYPE_NULL] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_ACTIVATOR] = ActivatorController;
                _windowClassTable[WindowType.WINDOW_TYPE_BACKGROUND] = BackgroundController;
                _windowClassTable[WindowType.WINDOW_TYPE_BORDER] = BorderController;
                _windowClassTable[WindowType.WINDOW_TYPE_BOXSIZER] = BoxSizerController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUBBLE] = BubbleController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUBBLE_POINTER_UP] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUBBLE_POINTER_RIGHT] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUBBLE_POINTER_DOWN] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUBBLE_POINTER_LEFT] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUTTON] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUTTON_THICK] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUTTON_GROUP_LEFT] = ButtonGroupController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUTTON_GROUP_CENTER] = ButtonGroupController;
                _windowClassTable[WindowType.WINDOW_TYPE_BUTTON_GROUP_RIGHT] = ButtonGroupController;
                _windowClassTable[WindowType.WINDOW_TYPE_BITMAP_WRAPPER] = BitmapWrapperController;
                _windowClassTable[WindowType.WINDOW_TYPE_CHECKBOX] = CheckboxController;
                _windowClassTable[WindowType.WINDOW_TYPE_CONTAINER] = ContainerController;
                _windowClassTable[WindowType.WINDOW_TYPE_CONTAINER_BUTTON] = ContainerButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_CLOSEBUTTON] = CloseButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_DISPLAY_OBJECT_WRAPPER] = DisplayObjectWrapperController;
                _windowClassTable[WindowType.WINDOW_TYPE_DRAGBAR] = DragBarController;
                _windowClassTable[WindowType.WINDOW_TYPE_DROPMENU] = DropMenuController;
                _windowClassTable[WindowType.WINDOW_TYPE_DROPMENU_ITEM] = DropMenuItemController;
                _windowClassTable[WindowType.WINDOW_TYPE_DROPLIST] = DropListController;
                _windowClassTable[WindowType.WINDOW_TYPE_DROPLIST_ITEM] = DropListItemController;
                _windowClassTable[WindowType.WINDOW_TYPE_FORMATTED_TEXT] = FormattedTextController;
                _windowClassTable[WindowType.WINDOW_TYPE_FRAME] = FrameController;
                _windowClassTable[WindowType.WINDOW_TYPE_HEADER] = HeaderController;
                _windowClassTable[WindowType.WINDOW_TYPE_HTML] = HTMLTextController;
                _windowClassTable[WindowType.WINDOW_TYPE_ICON] = IconController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMLIST] = ItemListController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMLIST_HORIZONTAL] = ItemListController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMLIST_VERTICAL] = ItemListController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMGRID] = ItemGridController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMGRID_HORIZONTAL] = ItemGridController;
                _windowClassTable[WindowType.WINDOW_TYPE_ITEMGRID_VERTICAL] = ItemGridController;
                _windowClassTable[WindowType.WINDOW_TYPE_LABEL] = TextLabelController;
                _windowClassTable[WindowType.WINDOW_TYPE_LINK] = TextLinkController;
                _windowClassTable[WindowType.WINDOW_TYPE_PASSWORD] = PasswordFieldController;
                _windowClassTable[WindowType.WINDOW_TYPE_RADIOBUTTON] = RadioButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_REGION] = RegionController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCALER] = ScalerController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_HORIZONTAL] = ScrollBarController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_VERTICAL] = ScrollBarController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_UP] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_DOWN] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_LEFT] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BUTTON_RIGHT] = ButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_HORIZONTAL] = DragBarController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_BAR_VERTICAL] = DragBarController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_HORIZONTAL] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLBAR_SLIDER_TRACK_VERTICAL] = WindowController;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL] = ScrollableItemListWindow;
                _windowClassTable[WindowType.WINDOW_TYPE_SCROLLABLE_ITEMGRID_VERTICAL] = ScrollableItemGridWindow;
                _windowClassTable[WindowType.WINDOW_TYPE_SELECTOR] = SelectorController;
                _windowClassTable[WindowType.WINDOW_TYPE_SELECTOR_LIST] = SelectorListController;
                _windowClassTable[WindowType.WINDOW_TYPE_STATIC_BITMAP_WRAPPER] = StaticBitmapController;
                _windowClassTable[WindowType.WINDOW_TYPE_TAB_BUTTON] = TabButtonController;
                _windowClassTable[WindowType.WINDOW_TYPE_TAB_CONTAINER_BUTTON] = TabContainerController;
                _windowClassTable[WindowType.WINDOW_TYPE_TAB_CONTENT] = ContainerController;
                _windowClassTable[WindowType.WINDOW_TYPE_TAB_CONTEXT] = TabContextController;
                _windowClassTable[WindowType.WINDOW_TYPE_TAB_SELECTOR] = SelectorListController;
                _windowClassTable[WindowType.WINDOW_TYPE_TEXT] = TextController;
                _windowClassTable[WindowType.WINDOW_TYPE_TEXTFIELD] = TextFieldController;
                _windowClassTable[WindowType.WINDOW_TYPE_TOOLTIP] = TooltipController;
                _windowClassTable[WindowType.WINDOW_TYPE_WIDGET] = WidgetWindowController;
            }
        }

        public static function getWindowClassByType(k:uint):Class
        {
            return _windowClassTable[k];
        }
    }
}

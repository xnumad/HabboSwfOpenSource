package com.sulake.core.window.utils
{
    import com.sulake.core.window.enum.WindowParam;
    import flash.utils.Dictionary;

    public class ParamCodeTable extends WindowParam 
    {
        public static function _Str_8871(k:Dictionary, _arg_2:Dictionary=null):void
        {
            var _local_3:String;
            k["null"] = WINDOW_PARAM_NULL;
            k["bound_to_parent_rect"] = WINDOW_PARAM_BOUND_TO_PARENT_RECT;
            k["child_window"] = WINDOW_PARAM_CHILD_WINDOW;
            k["embedded_controller"] = WINDOW_PARAM_EMBEDDED_CONTROLLER;
            k["expand_to_accommodate_children"] = WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN;
            k["input_event_processor"] = WINDOW_PARAM_INPUT_EVENT_PROCESSOR;
            k["internal_event_handling"] = WINDOW_PARAM_INTERNAL_EVENT_HANDLING;
            k["mouse_dragging_target"] = WINDOW_PARAM_MOUSE_DRAGGING_TARGET;
            k["mouse_dragging_trigger"] = WINDOW_PARAM_MOUSE_DRAGGING_TRIGGER;
            k["mouse_scaling_target"] = WINDOW_PARAM_MOUSE_SCALING_TARGET;
            k["mouse_scaling_trigger"] = WINDOW_PARAM_MOUSE_SCALING_TRIGGER;
            k["horizontal_mouse_scaling_trigger"] = WINDOW_PARAM_HORIZONTAL_MOUSE_SCALING_TRIGGER;
            k["vertical_mouse_scaling_trigger"] = WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER;
            k["observe_parent_input_events"] = WINDOW_PARAM_OBSERVE_PARENT_INPUT_EVENTS;
            k["parent_window"] = WINDOW_PARAM_PARENT_WINDOW;
            k["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
            k["relative_horizontal_scale_center"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER;
            k["relative_horizontal_scale_fixed"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED;
            k["relative_horizontal_scale_move"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_MOVE;
            k["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH;
            k["relative_scale_center"] = WINDOW_PARAM_RELATIVE_SCALE_CENTER;
            k["relative_scale_fixed"] = WINDOW_PARAM_RELATIVE_SCALE_FIXED;
            k["relative_scale_move"] = WINDOW_PARAM_RELATIVE_SCALE_MOVE;
            k["relative_scale_strech"] = WINDOW_PARAM_RELATIVE_SCALE_STRETCH;
            k["relative_vertical_scale_center"] = WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER;
            k["relative_vertical_scale_fixed"] = WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED;
            k["relative_vertical_scale_move"] = WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_MOVE;
            k["relative_vertical_scale_strech"] = WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH;
            k["on_resize_align_left"] = WINDOW_PARAM_ON_RESIZE_ALIGN_LEFT;
            k["on_resize_align_right"] = WINDOW_PARAM_ON_RESIZE_ALIGN_RIGHT;
            k["on_resize_align_center"] = WINDOW_PARAM_ON_RESIZE_ALIGN_CENTER;
            k["on_resize_align_top"] = WINDOW_PARAM_ON_RESIZE_ALIGN_TOP;
            k["on_resize_align_bottom"] = WINDOW_PARAM_ON_RESIZE_ALIGN_BOTTOM;
            k["on_resize_align_middle"] = WINDOW_PARAM_ON_RESIZE_ALIGN_MIDDLE;
            k["on_accommodate_align_left"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_LEFT;
            k["on_accommodate_align_right"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_RIGHT;
            k["on_accommodate_align_center"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_CENTER;
            k["on_accommodate_align_top"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_TOP;
            k["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
            k["on_accommodate_align_middle"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_MIDDLE;
            k["route_input_events_to_parent"] = WINDOW_PARAM_ROUTE_INPUT_EVENTS_TO_PARENT;
            k["use_parent_graphic_context"] = WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT;
            k["draggable_with_mouse"] = WINDOW_PARAM_DRAGGABLE_WITH_MOUSE;
            k["scalable_with_mouse"] = WINDOW_PARAM_SCALABLE_WITH_MOUSE;
            k["reflect_horizontal_resize_to_parent"] = WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT;
            k["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
            k["reflect_resize_to_parent"] = WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT;
            k["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
            k["inherit_caption"] = WINDOW_PARAM_INHERIT_CAPTION;
            if (_arg_2 != null)
            {
                for (_local_3 in k)
                {
                    _arg_2[k[_local_3]] = _local_3;
                }
            }
        }
    }
}

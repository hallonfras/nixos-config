import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import Battery from "gi://AstalBattery"
import { Variable, bind } from "astal"
import { exec } from "astal/process"

const time = Variable("").poll(1000, "date '+%a %d %b %k:%M'")
const window = Variable("").poll(
        500, 
        ["niri", "msg", "--json" ,"focused-window"], 
        (out:string) => (JSON.parse(out)).title 
    )

const workspaces = Variable("").poll(100, ["niri", "msg", "--json" ,"workspaces"])

const workspace_list = Variable([])

workspaces.subscribe((json: string) => {
    workspace_list.set(JSON.parse(json))
})

function Workspaces() {
    return <box cssName="workspaces">
      {bind(workspace_list).as(workspaces => workspaces.sort((a,b): number => a.idx - b.idx).map(
          // workspace => console.log(workspace.is_active)
        workspace => <label cssClasses={[workspace.is_active ? "active" : "false"]} label={workspace.idx.toString()} />
      ))}
    </box>
}

function BatteryPercentage() {
    const bat = Battery.get_default()

    return <label cssName="battery" label={bind(bat, "percentage").as((p) => p * 100 + " %")} />
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <box orientation={0} cssName="centerbox">
          <box hexpand halign={Gtk.Align.START} orientation={0} cssName="items-left">
              <Workspaces />
              <label cssName="active-window" label={window()} />
            </box>

          <box hexpand halign={Gtk.Align.END} orientation={0} cssName="items-right">
              <BatteryPercentage />
              <label label={time()} />
            </box>
        </box>
    </window>
}

commands =
  'new tab'           : (message) -> chrome.tabs.create message.options
  'restore tab'       : (message) -> do chrome.sessions.restore
  'close tab'         : (message) -> chrome.tabs.getSelected null, (tab) -> chrome.tabs.remove tab.id
  'next tab'          : (message) -> select_tab (data) -> data.current_tab.index + 1
  'previous tab'      : (message) -> select_tab (data) -> data.current_tab.index - 1
  'pin tab'           : (message) -> chrome.tabs.getSelected null, (tab) -> chrome.tabs.update tab.id, { pinned: not tab.pinned }
  'move previous tab' : (message) -> move_tab (data) -> data.current_tab.index - 1
  'move next tab'     : (message) -> move_tab (data) -> data.current_tab.index + 1
  'notify'            : (message) -> chrome.notifications.create null, message.options
  'detach tab'        : (message) -> chrome.tabs.getSelected null, (current_tab) -> chrome.windows.create { tabId: current_tab.id }
  'attach tab'        : (message) -> chrome.windows.getLastFocused null, (last_focused_window) -> chrome.tabs.getSelected null, (current_tab) -> chrome.tabs.move current_tab.id, { windowId: last_focused_window.id, index: -1 }

chrome.extension.onRequest.addListener (request, sender) ->
  commands[request.command] request if commands[request.command]

# Helpers ├─────────────────────────────────────────────────────────────────────

select_tab = (callback) ->
  chrome.tabs.getAllInWindow null, (tabs) ->
    chrome.tabs.getSelected null, (current_tab) ->
      selected_tab_index = (callback({ tabs: tabs, current_tab: current_tab }) + tabs.length) % tabs.length
      chrome.tabs.update tabs[selected_tab_index].id, selected: true

move_tab = (callback) ->
  chrome.tabs.getAllInWindow null, (tabs) ->
    chrome.tabs.getSelected null, (current_tab) ->
      selected_tab_index = (callback({ current_tab: current_tab }) + tabs.length) % tabs.length
      chrome.tabs.move current_tab.id, index: selected_tab_index

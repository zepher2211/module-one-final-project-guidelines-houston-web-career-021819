def my_positions(parent)
  Position.all.select {|position| position.parent_id == parent.id}
end

def my_open_positions(parent)
    my_positions(parent).select {|position| position.position_filled == false}
end

def my_closed_positions(parent)
    my_positions(parent).select {|position| position.position_filled == true}
end

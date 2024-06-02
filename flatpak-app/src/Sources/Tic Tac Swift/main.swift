import Gtk

func main() {
    //Initialise GTK
    guard gtk_init_check(nil, nil) else {
        fatalError("Failed to initialise GTK")
    }

    let window = gtk_window_new("GTK_WINDOW_TOPLEVEL")
    gtk_window_set_title(GTK_WINDOW(window), "Tic Tac Swift")
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 300)
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit))

    //Create grid for board
    let grid = gtk_grid_new()
    gtk_container_add(GTK_CONTAINER(window), grid)

    var buttons = [[GtkWidget?]](repeating: [GtkWidget?](repeating: nil, count: 3), count: 3)

    for i in 0..<3 {
        for j in 0..<3 {
            let button = gtk_button_new_with_label("")
            buttons[i][j] = button
            gtk_grid_attach(GTK_GRID(grid), button, gint(j), gint(i), 1, 1)
            g_signal_connect(button, "clicked", G_CALLBACK(button_clicked), nil)
        }
    }

    gtk_widget_show_all(window)
    gtk_main()
}

func button_clicked(button: GtkButton, user_data: gpointer) {
    let label = gtk_button_get_label(button)
    if label == "" {
        gtk_button_set_label(button, "X")
    } else if label == "X" {
        gtk_button_set_label(button, "O")
    } else {
        gtk_button_set_label(button, "")
    }
}

main()

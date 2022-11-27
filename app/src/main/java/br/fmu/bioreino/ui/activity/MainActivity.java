package br.fmu.bioreino.ui.activity;

import android.os.Bundle;
import android.view.MenuItem;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.google.android.material.navigation.NavigationView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.ui.fragments.HomeFragment;

public class MainActivity extends AppCompatActivity {

    private DrawerLayout drawerLayout;

    // Métodos principais --------------------------------------------------------------------------
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Código
        // Navigation
        configuraMenu();

        trocaTela(new HomeFragment());
    }

    private void configuraMenu() {
        drawerLayout = findViewById(R.id.activity_main_drawerLayout);
        configuraBotaoAppbar();
        configuraMenuNavegation();
    }

    private void configuraMenuNavegation() {
        NavigationView menu = findViewById(R.id.activity_home_navigationView);
        menu.inflateMenu(R.menu.menu_navigation);
        menu.setNavigationItemSelectedListener(item -> {

            final int home = R.id.menu_navigation_home;

            int id = item.getItemId();
            drawerLayout.closeDrawer(GravityCompat.START);
            item.setChecked(true);
            switch (id) {

                case home:
                    trocaTela(new HomeFragment());
                    break;

                default:
                    Toast.makeText(MainActivity.this, "Ainda não disponível", Toast.LENGTH_SHORT).show();

            }

            return false;
        });
    }

    private void trocaTela(Fragment fragment) {
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();

        fragmentTransaction.replace(R.id.activity_home_frameLayout, fragment);
        fragmentTransaction.commit();
    }

    private void configuraBotaoAppbar() {
        ImageButton botaoMenu = findViewById(R.id.activity_home_appbar_menu);
        botaoMenu.setOnClickListener(view -> drawerLayout.openDrawer(GravityCompat.START));
    }

}
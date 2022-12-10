package br.fmu.bioreino.ui.activity;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageButton;
import android.widget.Toast;
import android.widget.Toolbar;

import androidx.activity.OnBackPressedCallback;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import com.google.android.material.navigation.NavigationView;

import br.fmu.bioreino.ui.fragments.AulasFragment;
import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.ui.fragments.CategoriaFragment;
import br.fmu.bioreino.ui.fragments.HomeFragment;
import br.fmu.bioreino.util.Comunicador;

public class MainActivity extends AppCompatActivity implements Comunicador {

    private final FragmentManager fragmentManager = getSupportFragmentManager();
    private DrawerLayout drawerLayout;

    // Fragments -----------------------------------------------------------------------------------
    HomeFragment homeFragment = new HomeFragment();
    AulasFragment aulasFragment = new AulasFragment();
    CategoriaFragment categoriaFragment = new CategoriaFragment();

    // Métodos principais --------------------------------------------------------------------------
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        configuraMenu();

        trocaTela(homeFragment);
    }

    // Configurações -------------------------------------------------------------------------------
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
                    trocaTela(homeFragment);
                    break;

                default:
                    mostraMensagemAindaNaoDisponivel(this);
            }

            return false;
        });
    }



    // Helpers -------------------------------------------------------------------------------------
    @Override
    public void trocaTela(Fragment fragment) {
        FragmentTransaction fragmentTransaction = getFragmentTransaction(fragment);

        fragmentTransaction.replace(R.id.activity_home_frameLayout, fragment);
        fragmentTransaction.commit();
    }

    @Override
    public void trocaTela(Fragment fragment, Bundle bundle) {
        FragmentTransaction fragmentTransaction = getFragmentTransaction(fragment);

        fragment.setArguments(bundle);

        fragmentTransaction.replace(R.id.activity_home_frameLayout, fragment);
        fragmentTransaction.commit();
    }

    @NonNull
    private FragmentTransaction getFragmentTransaction(Fragment fragment) {
        return (fragment != homeFragment)
                ? fragmentManager.beginTransaction().addToBackStack(fragment.getTag())
                : fragmentManager.beginTransaction();
    }

    @Override
    public void enviaCurso(Curso curso) {
        Bundle bundle = new Bundle();
        bundle.putSerializable("curso", curso);

        trocaTela(aulasFragment, bundle);
    }

    @Override
    public void enviaCategoria(String categoria) {
        Bundle bundle = new Bundle();
        bundle.putString("categoria", categoria);

        trocaTela(categoriaFragment, bundle);
    }

    @Override
    public void trocaAppBar(Toolbar toolbar) {

    }

    @Override
    public void configuraBotaoVoltarSistema(Fragment fragmentAtual) {
        OnBackPressedCallback quandoBotaoVoltarPressionado = new OnBackPressedCallback(true) {
            @Override
            public void handleOnBackPressed() {
                fragmentAtual.getParentFragmentManager().popBackStack();
            }
        };
        fragmentAtual
                .requireActivity()
                .getOnBackPressedDispatcher()
                .addCallback(fragmentAtual, quandoBotaoVoltarPressionado);
    }


    public void mostraMensagemAindaNaoDisponivel(Context context) {
        Toast.makeText(context, "Ainda não disponível", Toast.LENGTH_SHORT).show();
    }

    private void configuraBotaoAppbar() {
        ImageButton botaoMenu = findViewById(R.id.activity_home_appbar_menu);
        botaoMenu.setOnClickListener(view -> drawerLayout.openDrawer(GravityCompat.START));
    }

}
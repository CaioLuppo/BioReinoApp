package br.fmu.bioreino.view.activity

import android.content.Context
import android.os.Bundle
import android.view.MenuItem
import android.view.View
import android.widget.Toast
import android.widget.Toolbar
import androidx.activity.OnBackPressedCallback
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.forEach
import androidx.drawerlayout.widget.DrawerLayout
import androidx.drawerlayout.widget.DrawerLayout.DrawerListener
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentTransaction
import br.fmu.bioreino.LoadingFragment
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.util.Comunicator
import br.fmu.bioreino.databinding.ActivityMainBinding
import br.fmu.bioreino.model.entities.Curso
import br.fmu.bioreino.view.fragments.CategoriesFragment
import br.fmu.bioreino.view.fragments.HomeFragment
import br.fmu.bioreino.view.fragments.LessonsFragment
import com.google.android.material.navigation.NavigationView

class MainActivity : AppCompatActivity(), Comunicator {

    private val mainBinding by lazy {
        ActivityMainBinding.inflate(layoutInflater)
    }

    private val fragmentManager = supportFragmentManager
    private val homeFragment = HomeFragment()
    private val lessonsFragment = LessonsFragment()
    private val categoriesFragment = CategoriesFragment()

    private lateinit var drawer: DrawerLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(mainBinding.root)
        configurateMenu()
        changeFragment(homeFragment)

    }


    // Configurations ------------------------------------------------------------------------------
    private fun configurateMenu() {
        drawer = findViewById(R.id.activity_main_drawerLayout)
        openDrawerWith(R.id.activity_home_appbar_menu)
        configurateDrawerNavigation()
    }

    // Configs -------------------------------------------------------------------------------------
    private fun openDrawerWith(viewId: Int) {
        val view = findViewById<View>(viewId)
        view.setOnClickListener { drawer.open() }
    }

    private fun configurateDrawerNavigation() {
        val drawerMenu: NavigationView = mainBinding.activityMainNavigationView
        val homeId = R.id.menu_navigation_home
        drawerMenu.inflateMenu(R.menu.navigation_menu)
        drawerMenu.menu.findItem(homeId).isChecked = true
        drawerMenu.setNavigationItemSelectedListener {
            val itemId = it.itemId
            drawerMenu.menu.forEach { item: MenuItem ->
                if (item.hasSubMenu()) item.subMenu?.forEach { subItem ->
                    subItem.isChecked = false
                }
            }

            it.isChecked = true
            when (itemId) {
                homeId -> changeFragmentFromMenu(homeFragment)
                else -> showNotYetDefined(this)
            }


            true
        }

    }


    // Comunicator ---------------------------------------------------------------------------------
    override fun changeFragment(fragment: Fragment, bundle: Bundle?) {
        val fragmentTransaction: FragmentTransaction = getFragmentTransaction(fragment)
        bundle.let { fragment.arguments = bundle }
        fragmentTransaction.replace(R.id.activity_home_frameLayout, fragment, "actual_fragment")
        fragmentTransaction.commit()
    }

    override fun enviaCurso(curso: Curso) {
        val bundle = Bundle()
        bundle.putSerializable("curso", curso)
        changeFragment(lessonsFragment, bundle)
    }

    override fun enviaCategoria(categoria: String) {
        val bundle = Bundle()
        bundle.putString("categoria", categoria)
        changeFragment(categoriesFragment, bundle)
    }

    override fun trocaAppBar(toolbar: Toolbar) {
        TODO("Not yet implemented")
    }

    override fun configuraBotaoVoltarSistema(fragmentAtual: Fragment) {
        val quandoBotaoVoltarPressionado: OnBackPressedCallback =
            object : OnBackPressedCallback(true) {
                override fun handleOnBackPressed() {
                    fragmentAtual.parentFragmentManager.popBackStack()
                }
            }
        fragmentAtual.requireActivity().onBackPressedDispatcher.addCallback(
            fragmentAtual,
            quandoBotaoVoltarPressionado
        )
    }


    // Helpers -------------------------------------------------------------------------------------
    private fun getFragmentTransaction(fragment: Fragment): FragmentTransaction {
        return if (fragment !== homeFragment) {
            fragmentManager.beginTransaction().addToBackStack(fragment.tag)
        } else {
            fragmentManager.beginTransaction()
        }
    }

    private fun changeFragmentFromMenu(fragment: Fragment) {
        fragmentManager.findFragmentByTag("actual_fragment")?.let {
            if (it != fragment) {
                changeFragment(LoadingFragment())
                drawer.addDrawerListener(object : DrawerListener {
                    override fun onDrawerClosed(drawerView: View) {
                        changeFragment(fragment)
                    }
                    override fun onDrawerSlide(drawerView: View, slideOffset: Float) {}
                    override fun onDrawerOpened(drawerView: View) {}
                    override fun onDrawerStateChanged(newState: Int) {}
                })
            }
            drawer.close()
        }

    }

    fun showNotYetDefined(context: Context?) {
        Toast.makeText(context, "Ainda não disponível", Toast.LENGTH_SHORT).show()
    }

}